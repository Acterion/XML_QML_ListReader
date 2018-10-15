import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.XmlListModel 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    XmlListModel {
        id: xmlModel
        source: "file:///Users/Acterion/QML_XML_test1/test.xml"
        query: "/rss/channel/item"


        XmlRole {
            name: "title";
            query: "title/string()"
        }
        XmlRole {
            name: "url";
            query: "data/string()"
        }
        XmlRole {
            name: "imgSrc";
            query: "source/string()"
        }
        onStatusChanged: {
            console.log("Status changed...", status)
            console.log(errorString())
        }
    }

    ListView{
        width: 180
        height: 300
        id: listView
        model: xmlModel
        header: Item{
            height:20
            Text{
                id: text1
                text: "Logo"
                width: 30
                anchors.left: parent.Left
            }
            Text{
                id: text2
                text: "Repo name"
                width: 100
                anchors.left: text1.right
                anchors.leftMargin: 10
            }
            Text{
                id: text3
                text: "Repo url"
                width: 200
                anchors.left: text2.right
                anchors.leftMargin: 10
            }
        }

        delegate: Item {
            height: 30
            Image {
                id: image
                width: 30
                height: 30
                source: "file://"+imgSrc
            }
            Text {
                id: name
                width: 100
                anchors.left: image.right
                anchors.leftMargin: 10
                x: 32
                text: title
                clip: true
            }
            Text {
                width: 200
                anchors.left: name.right
                anchors.leftMargin: 10
                x: 32
                text: url
                clip: true
            }
        }
    }
}
