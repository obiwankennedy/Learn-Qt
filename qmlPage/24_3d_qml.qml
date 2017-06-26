import QtQuick 2.2 as QQ2
import QtQuick.Window 2.2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import QtQuick.Scene3D 2.0

SlidePage {

    id: rectangle1
    anchors.fill: parent
    logo: "qrc:/rsrc/logo.png"
    focus: true
    title: "3d en QML"

    QQ2.ListModel {
        id: listSection
        QQ2.ListElement {
            name: "Initialisation du projet"
            index:0
        }
        QQ2.ListElement {
            name: "Usage d’une Scene3d"
            index:2
        }
        QQ2.ListElement {
            name: "Entity"
            index:4
        }
        QQ2.ListElement {
            name: "Mesh"
            index:6
        }
        QQ2.ListElement {
            name: "Material"
            index:8
        }
        QQ2.ListElement {
            name: "Transform"
            index:10
        }
        QQ2.ListElement {
            name: "Regroupement"
            index:12
        }
        QQ2.ListElement {
            name: "Camera"
            index:14
        }
    }
    onIdStateChanged: {
        if(idState == 1)
        {
            slideCode.visible = true;
            slideCode.code ="#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <QGuiApplication>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    Qt3DExtras::Quick::Qt3DQuickWindow view;
    view.setSource(QUrl(\"qrc:/main.qml\"));
    view.show();

    return app.exec();
}"
            view.opacity = 0
        }
        else if(idState == 3)
        {
            slideCode.visible = true;
            slideCode.code ="
import QtQuick.Scene3D 2.0

    Scene3D {
                id: scene3d
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: parent.width*0.5
                height: parent.height*0.5
                anchors.margins: 10
                focus: true
                aspects: [\"input\", \"logic\"]
                cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
";
            view.opacity = 0
        }
        else if(idState == 5)
        {
            slideCode.visible = true;
            slideCode.code ="
Entity {
    id: sceneRoot
}
";
            view.opacity = 0
        }
        else if(idState == 7)
        {
            slideCode.visible = true;
            slideCode.code ="
        TorusMesh {
            id: torusMesh
            radius: 5
            minorRadius: 2
            rings: 100
            slices: 20
        }
";
            view.opacity = 0
        }
        else if(idState == 9)
        {
            slideCode.visible = true;
            slideCode.code ="
        PhongMaterial {
            id: material
            ambient: \"red\"
            diffuse: \"yellow\"
            specular: \"yellow\"
        }
";
            view.opacity = 0
        }
        else if(idState == 11)
        {
            slideCode.visible = true;
            slideCode.code ="
        Transform {
            id: sphereTransform
            property real userAngle: 0.0
            matrix: {
                var m = Qt.matrix4x4();
                m.rotate(userAngle, Qt.vector3d(0, 1, 0));
                m.translate(Qt.vector3d(20, 0, 0));
                return m;
            }
        }
";
            view.opacity = 0
        }
        else if(idState == 13)
        {
            slideCode.visible = true;
            slideCode.code ="
        Entity {
            id: sphereEntity
            components: [ sphereMesh, material, sphereTransform ]
        }
";
            view.opacity = 0
        }
        else if(idState == 15)
        {
            slideCode.visible = true;
            slideCode.code ="
        Camera {
            id: camera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            aspectRatio: 16/9
            nearPlane : 0.1
            farPlane : 1000.0
            position: Qt.vector3d( 0.0, 0.0, -40.0 )
            upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
            viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
        }

        OrbitCameraController {
            camera: camera
        }
";
            view.opacity = 0
        }
        else
        {

            view.opacity = 1
            slideCode.visible = false
            view.focus = false
        }
    }
    QQ2.Component.onCompleted:
    {
        points = listSection
        anchors.fill = parent
    }
    Scene3D {
                id: scene3d
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: parent.width*0.5
                height: parent.height*0.5
                anchors.margins: 10
                focus: true
                aspects: ["input", "logic"]
                cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

              //  AnimatedEntity {}

    Entity {
        id: sceneRoot

        Camera {
            id: camera
            projectionType: CameraLens.PerspectiveProjection
            fieldOfView: 45
            aspectRatio: 16/9
            nearPlane : 0.1
            farPlane : 1000.0
            position: Qt.vector3d( 0.0, 0.0, -40.0 )
            upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
            viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
        }

        OrbitCameraController {
            camera: camera
        }

        components: [
            RenderSettings {
                activeFrameGraph: ForwardRenderer {
                    clearColor: Qt.rgba(0, 0.5, 1, 0.0)
                    camera: camera
                }
            },
            // Event Source will be set by the Qt3DQuickWindow
            InputSettings { }
        ]

        PhongMaterial {
            id: material
            ambient: "red"
            diffuse: "yellow"
            specular: "yellow"
        }

        TorusMesh {
            id: torusMesh
            radius: 5
            minorRadius: 2
            rings: 100
            slices: 20
        }

        Transform {
            id: torusTransform
            scale3D: Qt.vector3d(1.5, 1, 0.5)
            rotation: fromAxisAndAngle(Qt.vector3d(1, 0, 0), 45)
        }

        Entity {
            id: torusEntity
            components: [ torusMesh, material, torusTransform ]
        }

        SphereMesh {
            id: sphereMesh
            radius: 3
        }

        Transform {
            id: sphereTransform
            property real userAngle: 0.0
            matrix: {
                var m = Qt.matrix4x4();
                m.rotate(userAngle, Qt.vector3d(0, 1, 0));
                m.translate(Qt.vector3d(20, 0, 0));
                return m;
            }
        }

        QQ2.NumberAnimation {
            target: sphereTransform
            property: "userAngle"
            duration: 10000
            from: 0
            to: 360

            loops: QQ2.Animation.Infinite
            running: true
        }

        Entity {
            id: sphereEntity
            components: [ sphereMesh, material, sphereTransform ]
        }
    }
  }
}
