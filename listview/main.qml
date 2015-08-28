import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

ApplicationWindow {
    id: mainWindow
    visible: true

    width: 800
    height: 600

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "Exit"; onTriggered: Qt.quit() }
        }
        Menu {
            title: "TryMe"
            MenuItem { text: "Try me, for real" }
        }
    }

    StackView {
        id: stack
        initialItem: listView
        width: 800
        height: 600

        Component {
            id: listView

           
             ListView {
                model: ListElementModel {}
                delegate: Component {
                    id: listElementDelegate
                    Item {
                        width: 180; height: 40
                        MouseArea {
                            anchors.fill: parent
                            Column {
                                Text {id: title_text; text: '<b>Title:</b> ' + title }
                                Text { text: '<b>Text:</b> ' + copy }
                            }
                            onClicked: stack.push({item: detailView, properties: {info: more_info}})
                                 }
                            }
                 }


                highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                focus: true
            }
        }


        Component {
            id: detailView

            Rectangle {
                property string info
                width: parent.width; height: parent.height 
                Item {
                    width: parent.width; height: parent.height 
                    MouseArea {
                        anchors.fill: parent
                        Column {
                            Text { text: '<b>Info:</b> ' + info}
                        }
                        onClicked: stack.pop()
                    }
                }
            }
        }

    }
}

