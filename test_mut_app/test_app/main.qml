import QtQuick 2.4
import QtQuick.Controls 1.3 as Controls

import Mut 0.1
import Mut.ListItems 0.1
import Mut.Themes 0.1
import Mut.Styles 0.1

ApplicationWindow {
    id: app
    visible: true
    title: qsTr("My uselessly shiny app")
    width: 200
    height: 400

    pageStack.initialItem: page

    Component.onCompleted: {
        Theme.imageAssetsPath = "qrc:///icons/";
    }

    Component {
        id: page

        Page {
            title: qsTr("My checkbox")
            
            property ListModel checkedList: ListModel {}
            Paper {
                anchors.fill: parent

                ListModel {
                    id: listModel
                    ListElement { text: "Text one" }
                    ListElement { text: "Text two" }
                    ListElement { text: "Text three" }
                }

                ListView {
                    width: parent.width
                    height: parent.height
                    model: listModel 

                    delegate: CheckBox {
                        text: model.text
                        source: Qt.resolvedUrl("./icons/done.svg")
                        onCheckedChanged: {
                            if(checked) {
                                checkedList.append(this)
                            } else {
                                for (var i = 0; i < checkedList.count; i++) {
                                    if (checkedList.get(i).text === text) checkedList.remove(i, 1)
                                }
                            }
                        }
                    }
                }

                Controls.Button {
                    style: ActionButtonStyle {}

                    iconSource: Qt.resolvedUrl("./icons/apps.svg") 
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: Units.dp(10)
                    anchors.right: parent.right
                    anchors.rightMargin: Units.dp(10)
                    text: qsTr("Send")
                    action: Controls.Action {
                        onTriggered: {
                            for ( var i = 0; i < checkedList.count; i++)
                                console.log(checkedList.get(i).text)
                        }
                    }
                }
            }
        }
    }
}

