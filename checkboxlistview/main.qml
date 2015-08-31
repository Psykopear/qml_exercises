import QtQuick 2.4
import QtQuick.Controls 1.3

ApplicationWindow {
    id: mainWindow
    visible: true
    property ListModel checked: ListModel {}

    width: 800
    height: 600

    ListModel {
        id: listModel
        ListElement { text: "Text one" }
        ListElement { text: "Text two" }
        ListElement { text: "Text three" }
    }

    ListView {
        id: listView
        anchors.top: parent.top
        anchors.bottom: button.top
        model: listModel
        delegate: CheckBox {
            text: model.text
            onCheckedChanged: {
                if (checked) 
                    mainWindow.checked.append(this)
                }
        }
    }

    Button {
        id: button
        anchors.bottom: parent.bottom
        text: qsTr("Send")
        action: Action {
            onTriggered: {
                for ( var i=0; i<mainWindow.checked.count; i++ )
                    console.log("Text: " + mainWindow.checked.get(i).text + "\nValue: " + mainWindow.checked.get(i).checked)
            }
        }
    }
}

