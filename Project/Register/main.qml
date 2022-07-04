import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

import QtQuick.VirtualKeyboard 2.1
//import QtW

import "./component.js" as Component

Window {
//    width: showFullScreen()
//    height: showFullScreen()
            width: 1000
            height: 800
    visible: true
    title: qsTr("Register")

    property bool validateIdCardStatus: false
    property bool validatePatternIdCardStatus: false

    property bool validateFirstNameStatus: false
    property bool validateLastNameStatus: false
    property bool validateUserNameStatus: false
    property bool validateLengthUserNameStatus: false

    property bool validateEmailStatus: false
    property bool validatePatternEmailStatus: false

    property bool validatePasswordStatus: false
    property bool validateLengthPasswordStatus: false

    property bool validateConfirmPasswordStatus: false
    property bool validateConfirmStatus: false
    //    property bool validateLengthConfirmPasswordStatus: false

    property bool onClickIdCardStatus: false
    property bool onClickFirstNameStatus: false
    property bool onClickLastNameStatus: false
    property bool onClickUserNameStatus: false
    property bool onClickEmailStatus: false
    property bool onClickPasswordStatus: false
    property bool onClickConfirmPasswordStatus: false

    property bool onload: false


    //    Flickable {
    //        width: parent.width
    //        height: parent.height
    //        contentHeight: 1000

    //        ScrollBar.vertical: ScrollBar {
    //                        policy: ScrollBar.AlwaysOn
    //            snapMode: ScrollBar.SnapAlways
    //             parent: flickable.parent
    //        }

//    ScrollBar {
//        id: vbar
//        hoverEnabled: true
//        active: hovered || pressed
//        orientation: Qt.Vertical
//        size: frame.height/content.height

//        anchors.top: parent.top
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//    }



//    Flickable {

//                width: parent.width
//                height: parent.height
//                contentHeight: 1000
//        focus: true

//        Keys.onUpPressed: scrollBar.decrease()
//        Keys.onDownPressed: scrollBar.increase()

//        ScrollBar.vertical: ScrollBar { id: scrollBar }
//    }


    ColumnLayout{
        width: 500
        spacing: 10
//        y: -200
        anchors.centerIn: parent
//        anchors.horizontalCenter : AnchorLine



//        InputPanel {
//            id: inputPanel
//            externalLanguageSwitchEnabled: true
//            onExternalLanguageSwitch: languageDialog.show(localeList, currentIndex)
//            // ...
//        }

        //        BusyIndicator{
        //            id: busyIndicatorId
        //            Layout.alignment: Qt.AlignHCenter
        //            running: onload
        //        }

        Button{
            id: buttonTwoId
            text: "read"
            font.pixelSize: 20
            Layout.fillWidth: true
            palette{
                button: "green"
            }
            contentItem: Text {
                text: buttonTwoId.text
                font: buttonTwoId.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                SL018.readCards();
            }
        }

        Rectangle{
            height: 20
        }

        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout{
                width: 100
                height: 50
                Label{
                    wrapMode: Label.Wrap
                    //                    horizontalAlignment: Qt.AlignHCenter
                    //                    verticalAlignment: Qt.AlignVCente
                    text: "Card ID :"
                    color: validateIdCardStatus?"red":"black"
                }
                Rectangle{
                    height: 10
                }
            }

            ColumnLayout{
                width: 300
                height: 50
                anchors.right: parent.right

                TextField{
                    id: textIdCard
                    placeholderText: "Enter your Card ID"
                    color: validateIdCardStatus?"red":"black"

                    background: Rectangle {
                        id: backGroundIdCard
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: validateIdCardStatus? "red":"darkgray"
                        border.width: 1
                        radius: 5
                    }


                    onEditingFinished: {
                        let status = Component.validateNotNull(textIdCard.text)
                        if(!status){
                            textIdCard.text = Component.stringToUpper(textIdCard.text)
                        }
                        validatePatternIdCardStatus = Component.validatePatternIdCard(textIdCard.text)
                        validateIdCardStatus = validatePatternIdCardStatus? true : status

                        if(validateIdCardStatus){
                            backGroundIdCard.border.color = "red"
                            backGroundIdCard.border.width = 1
                            if(validatePatternIdCardStatus&&!status){
                                textAlarmId.text="The input is not valid card id!"
                            }
                            else{
                                textAlarmId.text="Please input your card id!"
                            }


                        }else{
                            backGroundIdCard.border.color = "darkgray"
                            backGroundIdCard.border.width = 1
                            textAlarmId.text = ""
                        }
                    }

                    onActiveFocusChanged: {
                        onClickIdCardStatus = !onClickIdCardStatus

                        if(onClickIdCardStatus){
                            if(validateIdCardStatus){
                                backGroundIdCard.border.color = "red"
                                backGroundIdCard.border.width = 2
                            }else{
                                backGroundIdCard.border.color = "blue"
                                backGroundIdCard.border.width = 2
                            }
                        }
                        else{
                            if(validateIdCardStatus){
                                backGroundIdCard.border.color = "red"
                                backGroundIdCard.border.width = 1
                            }else{
                                backGroundIdCard.border.color = "darkgray"
                                backGroundIdCard.border.width = 1
                            }
                        }
                    }

                }

                Text {
                    id: textAlarmId
                    text: ""
                    font.pointSize: 10
                    color: "red"
                }
            }

        }

        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout{
                width: 100
                height: 50

                Label{
                    wrapMode: Label.Wrap
                    //                    horizontalAlignment: Qt.AlignHCenter
                    //                    verticalAlignment: Qt.AlignVCente
                    text: "First Name :"
                    color: validateFirstNameStatus?"red":"black"
                }
                Rectangle{
                    height: 10
                }

            }

            ColumnLayout{
                width: 300
                height: 50
                anchors.right: parent.right

                TextField{
                    id: textFirstNameId
                    placeholderText: "Enter your First Name"
                    color: validateFirstNameStatus?"red":"black"

                    background: Rectangle {
                        id: backGroundFirstNameId
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: validateFirstNameStatus? "red":"darkgray"
                        border.width: 1
                        radius: 5
                    }

                    onEditingFinished: {

                        let status = Component.validateNotNull(textFirstNameId.text)
                        validateFirstNameStatus = status

                        if(validateFirstNameStatus){
                            backGroundFirstNameId.border.color = "red"
                            backGroundFirstNameId.border.width = 1
                        }else{
                            backGroundFirstNameId.border.color = "darkgray"
                            backGroundFirstNameId.border.width = 1
                        }

                    }

                    onActiveFocusChanged: {
                        onClickFirstNameStatus = !onClickFirstNameStatus

                        if(onClickFirstNameStatus){
                            if(validateFirstNameStatus){
                                backGroundFirstNameId.border.color = "red"
                                backGroundFirstNameId.border.width = 2
                            }else{
                                backGroundFirstNameId.border.color = "blue"
                                backGroundFirstNameId.border.width = 2
                            }
                        }
                        else{
                            if(validateFirstNameStatus){
                                backGroundFirstNameId.border.color = "red"
                                backGroundFirstNameId.border.width = 1
                            }else{
                                backGroundFirstNameId.border.color = "darkgray"
                                backGroundFirstNameId.border.width = 1
                            }
                        }
                    }

                }

                Text {
                    text: validateFirstNameStatus?"Please input your first name!":""
                    font.pointSize: 10
                    color: "red"
                }
            }

        }

        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout{
                width: 100
                height: 50
                Label{
                    wrapMode: Label.Wrap
                    //                    horizontalAlignment: Qt.AlignHCenter
                    //                    verticalAlignment: Qt.AlignVCente
                    text: "Last Name :"
                    color: validateLastNameStatus?"red":"black"
                }
                Rectangle{
                    height: 10
                }
            }

            ColumnLayout{
                width: 300
                height: 50
                anchors.right: parent.right

                TextField{
                    id: textLastNameId
                    placeholderText: "Enter your Last Name"
                    color: validateLastNameStatus?"red":"black"

                    background: Rectangle {
                        id: backGroundLastNameId
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: validateLastNameStatus? "red":"darkgray"
                        border.width: 1
                        radius: 5
                    }

                    onEditingFinished: {
                        let status = Component.validateNotNull(textLastNameId.text)
                        validateLastNameStatus = status

                        if(validateLastNameStatus){
                            backGroundLastNameId.border.color = "red"
                            backGroundLastNameId.border.width = 1
                        }else{
                            backGroundLastNameId.border.color = "darkgray"
                            backGroundLastNameId.border.width = 1
                        }
                    }

                    onActiveFocusChanged: {
                        onClickLastNameStatus = !onClickLastNameStatus

                        if(onClickLastNameStatus){
                            if(validateLastNameStatus){
                                backGroundLastNameId.border.color = "red"
                                backGroundLastNameId.border.width = 2
                            }else{
                                backGroundLastNameId.border.color = "blue"
                                backGroundLastNameId.border.width = 2
                            }
                        }
                        else{
                            if(validateLastNameStatus){
                                backGroundLastNameId.border.color = "red"
                                backGroundLastNameId.border.width = 1
                            }else{
                                backGroundLastNameId.border.color = "darkgray"
                                backGroundLastNameId.border.width = 1
                            }
                        }
                    }

                }

                Text {
                    text: validateLastNameStatus?"Please input your last name!":""
                    font.pointSize: 10
                    color: "red"
                }
            }

        }

        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout{
                width: 100
                height: 50
                Label{
                    wrapMode: Label.Wrap
                    //                    horizontalAlignment: Qt.AlignHCenter
                    //                    verticalAlignment: Qt.AlignVCente
                    text: "Username :"
                    color: validateUserNameStatus?"red":"black"
                }
                Rectangle{
                    height: 10
                }
            }

            ColumnLayout{
                width: 300
                height: 50
                anchors.right: parent.right

                TextField{
                    id: textUserNameId
                    placeholderText: "Enter your Username"
                    color: validateUserNameStatus?"red":"black"

                    background: Rectangle {
                        id: backGroundUserNameId
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: validateUserNameStatus? "red":"darkgray"
                        border.width: 1
                        radius: 5
                    }

                    onEditingFinished: {
                        let status = Component.validateNotNull(textUserNameId.text)
                        if(!status){
                            validateLengthUserNameStatus = Component.validateBetweenLingth(6,30,textUserNameId.text)
                        }
                        validateUserNameStatus = validateLengthUserNameStatus? true : status

                        if(validateUserNameStatus){
                            backGroundUserNameId.border.color = "red"
                            backGroundUserNameId.border.width = 1

                            if(validateLengthUserNameStatus&&!status){
                                textUserNameAlarmId.text = "username must be between 6 and 30 characters long."
                            }else{
                                textUserNameAlarmId.text = "Please input your username!"
                            }
                        }else{
                            backGroundUserNameId.border.color = "darkgray"
                            backGroundUserNameId.border.width = 1
                            textUserNameAlarmId.text = ""
                        }
                    }

                    onActiveFocusChanged: {
                        onClickUserNameStatus = !onClickUserNameStatus

                        if(onClickUserNameStatus){
                            if(validateUserNameStatus){
                                backGroundUserNameId.border.color = "red"
                                backGroundUserNameId.border.width = 2
                            }else{
                                backGroundUserNameId.border.color = "blue"
                                backGroundUserNameId.border.width = 2
                            }
                        }
                        else{
                            if(validateUserNameStatus){
                                backGroundUserNameId.border.color = "red"
                                backGroundUserNameId.border.width = 1
                            }else{
                                backGroundUserNameId.border.color = "darkgray"
                                backGroundUserNameId.border.width = 1
                            }
                        }
                    }

                }

                Text {
                    id: textUserNameAlarmId
                    text: ""
                    font.pointSize: 10
                    color: "red"
                }
            }

        }

        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout{
                width: 100
                height: 50
                Label{
                    wrapMode: Label.Wrap
                    //                    horizontalAlignment: Qt.AlignHCenter
                    //                    verticalAlignment: Qt.AlignVCente
                    text: "Email :"
                    color: validateEmailStatus?"red":"black"
                }
                Rectangle{
                    height: 10
                }
            }

            ColumnLayout{
                width: 300
                height: 50
                anchors.right: parent.right

                TextField{
                    id: textEmailId
                    placeholderText: "Enter your Email"
                    color: validateEmailStatus?"red":"black"

                    background: Rectangle {
                        id: backGroundEmailId
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: validateEmailStatus? "red":"darkgray"
                        border.width: 1
                        radius: 5
                    }

                    onEditingFinished: {
                        let status = Component.validateNotNull(textEmailId.text)
                        validatePatternEmailStatus = Component.validatePatternEmail(textEmailId.text)

                        validateEmailStatus = validatePatternEmailStatus? validatePatternEmailStatus:status

                        if(validateEmailStatus){
                            backGroundEmailId.border.color = "red"
                            backGroundEmailId.border.width = 1
                            if(validatePatternEmailStatus&&!status){
                                textEmailAlarmId.text="The input is not valid email!"
                            }
                            else{
                                textEmailAlarmId.text="Please input your email!"
                            }


                        }else{
                            backGroundEmailId.border.color = "darkgray"
                            backGroundEmailId.border.width = 1
                            textEmailAlarmId.text = ""
                        }


                    }

                    onActiveFocusChanged: {
                        onClickEmailStatus = !onClickEmailStatus

                        if(onClickEmailStatus){
                            if(validateEmailStatus){
                                backGroundEmailId.border.color = "red"
                                backGroundEmailId.border.width = 2
                            }else{
                                backGroundEmailId.border.color = "blue"
                                backGroundEmailId.border.width = 2
                            }
                        }
                        else{
                            if(validateEmailStatus){
                                backGroundEmailId.border.color = "red"
                                backGroundEmailId.border.width = 1
                            }else{
                                backGroundEmailId.border.color = "darkgray"
                                backGroundEmailId.border.width = 1
                            }
                        }
                    }

                }

                Text {
                    id: textEmailAlarmId
                    text: ""
                    font.pointSize: 10
                    color: "red"
                }
            }

        }

        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout{
                width: 100
                height: 50
                Label{
                    wrapMode: Label.Wrap
                    //                    horizontalAlignment: Qt.AlignHCenter
                    //                    verticalAlignment: Qt.AlignVCente
                    text: "Password :"
                    color: validatePasswordStatus?"red":"black"
                }
                Rectangle{
                    height: 10
                }
            }

            ColumnLayout{
                width: 300
                height: 50
                anchors.right: parent.right

                TextField{
                    id: textPasswordId
                    placeholderText: "Enter your Password"
                    color: validatePasswordStatus?"red":"black"
                    echoMode: "Password"

                    background: Rectangle {
                        id: backGroundPasswordId
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: validatePasswordStatus? "red":"darkgray"
                        border.width: 1
                        radius: 5
                    }

                    onEditingFinished: {
                        let status = Component.validateNotNull(textPasswordId.text)
                        validateLengthPasswordStatus = Component.validateMaxLingth(8,textPasswordId.text)
                        validatePasswordStatus = validateLengthPasswordStatus? true: status


                        if(validatePasswordStatus){
                            backGroundPasswordId.border.color = "red"
                            backGroundPasswordId.border.width = 1

                            if(validateLengthPasswordStatus&&!status){
                                textPasswordAlarmId.text = "Use 8 characters or more for your password"
                            }else{
                                textPasswordAlarmId.text = "Please input your password!"
                            }

                            if(textConfirmPasswordId.text){
                                validateConfirmPasswordStatus = true
                                backGroundConfirmPasswordId.border.color = "red"
                                backGroundConfirmPasswordId.border.width = 1
                                textConfirmPasswordAlarmId.text = "The two passwords that you entered do not match!"
                            }

                        }else{
                            backGroundPasswordId.border.color = "darkgray"
                            backGroundPasswordId.border.width = 1
                            textPasswordAlarmId.text = ""

                            if(Component.validateConfirmPassword() && textConfirmPasswordId.text){
                                validateConfirmPasswordStatus = true
                                backGroundConfirmPasswordId.border.color = "red"
                                backGroundConfirmPasswordId.border.width = 1
                                textConfirmPasswordAlarmId.text = "The two passwords that you entered do not match!"
                            }
                            else if(!Component.validateConfirmPassword() && textConfirmPasswordId.text){
                                validateConfirmPasswordStatus = false
                                backGroundConfirmPasswordId.border.color = "darkgray"
                                backGroundConfirmPasswordId.border.width = 1
                                textConfirmPasswordAlarmId.text = ""
                            }
                        }
                    }

                    onActiveFocusChanged: {
                        onClickPasswordStatus = !onClickPasswordStatus

                        if(onClickPasswordStatus){
                            if(validatePasswordStatus){
                                backGroundPasswordId.border.color = "red"
                                backGroundPasswordId.border.width = 2
                            }else{
                                backGroundPasswordId.border.color = "blue"
                                backGroundPasswordId.border.width = 2
                            }
                        }
                        else{
                            if(validatePasswordStatus){
                                backGroundPasswordId.border.color = "red"
                                backGroundPasswordId.border.width = 1
                            }else{
                                backGroundPasswordId.border.color = "darkgray"
                                backGroundPasswordId.border.width = 1
                            }
                        }
                    }

                }

                Text {
                    id: textPasswordAlarmId
                    text:""
                    font.pointSize: 10
                    color: "red"
                }
            }

        }

        RowLayout{
            anchors.left: parent.left
            anchors.right: parent.right

            ColumnLayout{
                width: 100
                height: 50
                Label{
                    wrapMode: Label.Wrap
                    //                    horizontalAlignment: Qt.AlignHCenter
                    //                    verticalAlignment: Qt.AlignVCente
                    text: "Confirm Password :"
                    color: validateConfirmPasswordStatus?"red":"black"
                }
                Rectangle{
                    height: 10
                }
            }

            ColumnLayout{
                width: 300
                height: 50
                anchors.right: parent.right

                TextField{
                    id: textConfirmPasswordId
                    placeholderText: "Enter your Confirm Password"
                    color: validateConfirmPasswordStatus?"red":"black"
                    echoMode: "Password"

                    background: Rectangle {
                        id: backGroundConfirmPasswordId
                        implicitWidth: 350
                        implicitHeight: 40
                        border.color: validateConfirmPasswordStatus? "red":"darkgray"
                        border.width: 1
                        radius: 5
                    }

                    onEditingFinished: {
                        let status = Component.validateNotNull(textConfirmPasswordId.text)
                        validateConfirmStatus = Component.validateConfirmPassword()
                        validateConfirmPasswordStatus = validateConfirmStatus ? true: status

                        if(validateConfirmPasswordStatus){
                            backGroundConfirmPasswordId.border.color = "red"
                            backGroundConfirmPasswordId.border.width = 1
                            if(validateConfirmStatus && !status){
                                if(!textPasswordId.text){
                                    textPasswordAlarmId.text = "Please input your password!"
                                    validatePasswordStatus = true
                                }
                                textConfirmPasswordAlarmId.text = "The two passwords that you entered do not match!"
                            }else{
                                textConfirmPasswordAlarmId.text = "Please input your Confirm  password!"
                            }
                        }else{
                            backGroundConfirmPasswordId.border.color = "darkgray"
                            backGroundConfirmPasswordId.border.width = 1
                            textConfirmPasswordAlarmId.text = ""
                        }
                    }

                    onActiveFocusChanged: {
                        onClickConfirmPasswordStatus = !onClickConfirmPasswordStatus

                        if(onClickConfirmPasswordStatus){
                            if(validateConfirmPasswordStatus){
                                backGroundConfirmPasswordId.border.color = "red"
                                backGroundConfirmPasswordId.border.width = 2
                            }else{
                                backGroundConfirmPasswordId.border.color = "blue"
                                backGroundConfirmPasswordId.border.width = 2
                            }
                        }
                        else{
                            if(validateConfirmPasswordStatus){
                                backGroundConfirmPasswordId.border.color = "red"
                                backGroundConfirmPasswordId.border.width = 1
                            }else{
                                backGroundConfirmPasswordId.border.color = "darkgray"
                                backGroundConfirmPasswordId.border.width = 1
                            }
                        }

                    }

                }

                Text {
                    id: textConfirmPasswordAlarmId
                    text: ""
                    font.pointSize: 10
                    color: "red"
                }
            }

        }

        Rectangle{
            height: 10
        }

        Button{
            id: buttonId
            text: "Register"
            font.pixelSize: 20
            Layout.fillWidth: true
            palette{
                button: "#00bfff"
            }
            contentItem: Text {
                text: buttonId.text
                font: buttonId.font
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                //                onload = !onload
                //                busyIndicatorId.running = onload
                //                massgeDialogId.open()

                if(Component.validateListData()){
                    //                                                    Component.createData(Component.listData())
                    Service.postKeyCards(Component.listData());
                }

                //                Component.getData()
                //                                Service.getKeyCards();

            }
        }


        Connections{
            target: Service
            onSenderDataService:{
                console.log("Status: "+status)
                console.log("Data: "+data)

                massgeDialogId.title = "Successfully"
                massgeDialogId.text = "Status: "+status+" Successfully!"

                massgeDialogId.open()
            }
            onSenderErrorService:{
                console.log("Status: "+status)
                console.log("Manager: "+manager)

                massgeDialogId.title = "Error status: "+status
                massgeDialogId.text = manager

                massgeDialogId.open()
            }
        }

        Connections{
            target: SL018
            onSenderId:{
                //                console.log("SL018");
                //                console.log("CardID :"+id);
                textIdCard.text = id;
            }


        }


        MessageDialog {
            id: massgeDialogId
            title: ""
            text: ""
            standardButtons: StandardButton.Close
        }

    }

    //        }

//        }
}

