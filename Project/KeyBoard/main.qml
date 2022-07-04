import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.1

Window {
    visible: true
    width: showFullScreen()
    height: showFullScreen()
    //    width:
    //    height: 480
    title: qsTr("KeyBoard")

    TextField {
        width: parent.width
        placeholderText: "One line field"
        //                enterKeyAction: EnterKeyAction.Next
        //        onAccepted: passwordField.focus = true

    }

    //    TextArea {
    //        id: textArea
    //        width: parent.width
    //        placeholderText: "Multiple line field"
    //        height: Math.max(206, implicitHeight)
    //    }



}
