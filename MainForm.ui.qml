import QtQuick 2.6
import QtQuick.XmlListModel 2.0

Rectangle {
    property alias mouseArea: mouseArea

    width: 360
    height: 360

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }
}
