
//const baseURL = "http://172.16.80.123:9094/api/v1/"
const baseURL = "https://6209cb1f92946600171c5508.mockapi.io/api/v1/"                          // MOCKUP API
//const baseURL = "http://api.icndb.com/jokes/random/";                                        // API TEST


function validateMaxLingth(number, value){
    return value.length < number
}
function validateMinLingth(number,value){
    return value.length > number
}
function validateBetweenLingth(min,max,value){
    return value.length<min || value.length>max
}
function stringToUpper(value){
    return value.toUpperCase()
}

function validateNotNull(value){
    return value === ''
}
function validateConfirmPassword(){
    return !(textPasswordId.text === textConfirmPasswordId.text)
}
function validatePatternIdCard(value){

    if(value.length<8 || value.length>8){
        return true
    }


    for(let i=0;i<value.length;i++){

        if( !( (parseInt(value[i])>=0&&parseInt(value[i])<=9) || (value[i]>='A'&&value[i]<='F') ) ){
            return true
        }
    }

    return false
}
function validatePatternEmail(value){
    if(!value){
        return true
    }

    let status = 0
    for(let z=0;z<value.length;z++){
        if(value[z]==='@'){
            status = 1
        }
        if(value[z]==='.'&&status){
            status = 2
        }
    }
    if(status<2){
        return true
    }

    value = value.split('@')
    value = value[1].split('.')

    for(let i=0;i<value.length;i++){
        if(!value[i]){
            return true
        }

        for(let j=0;j<value[i].length;j++){

            if(i>0&&value[i].length<2){
                return true
            }

            if(!(value[i][j].toLowerCase()>='a'&&value[i][j].toLowerCase()<='z')){
                return true
            }

        }
    }

    return false
}


function validateListData(){

    let status = true


    if(!textIdCard.text){
        validateIdCardStatus = true
        textAlarmId.text="Please input your card id!"
        status = false
    }
    if(!textFirstNameId.text){
        validateFirstNameStatus = true
        status = false
    }
    if(!textLastNameId.text){
        validateLastNameStatus = true
        status = false
    }
    if(!textUserNameId.text){
        validateUserNameStatus = true
        textUserNameAlarmId.text="Please input your username!"
        status = false
    }
    if(!textEmailId.text){
        validateEmailStatus = true
        textEmailAlarmId.text="Please input your email!"
        status = false
    }
    if(!textPasswordId.text){
        validatePasswordStatus = true
        textPasswordAlarmId.text = "Please input your password!"
        status = false
    }
    if(!textConfirmPasswordId.text){
        validateConfirmPasswordStatus = true
        textConfirmPasswordAlarmId.text = "Please input your Confirm  password!"
        status = false
    }

    if(validateIdCardStatus || validatePatternIdCardStatus || validateFirstNameStatus || validateLastNameStatus || validateUserNameStatus || validateLengthUserNameStatus || validateEmailStatus || validatePatternEmailStatus || validatePasswordStatus || validateLengthPasswordStatus || validateConfirmPasswordStatus || validateConfirmStatus){
        massgeDialogId.title = "Alarm"
        massgeDialogId.text = "Please fill out the information correctly and completely!"
        massgeDialogId.open()
        return false
    }


    return status
}
function listData(){
    //        let obj = {
    //            "idCard":textIdCard.text,
    //            "firstName":textFirstNameId.text,
    //            "lastName":textLastNameId.text,
    //            "userName":textUserNameId.text,
    //            "email":textEmailId.text,
    //            "password":textPasswordId.text
    //        }

    let obj ={
        "cardId" : textIdCard.text,
        "cardTypeId" : "mf-c-1k"
    }

    return obj
}


function getData() {
    request("GET", "10", null,function(resp){
        print(resp)
        return resp
    })
}


function createData(obj) {
    request("POST", "keycards", obj,function(resp){
        print(resp)
        return resp
    })
}

function request(verb, schema, obj, callback) {

    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){
            print('DONE')
            print('status: '+xhr.status)
            print('resp: '+xhr.responseText.toString())

            if(xhr.status === 200 || xhr.status === 201){
                massgeDialogId.title = "Successfully"
                massgeDialogId.text = "Status: "+xhr.status+" Successfully!"
                massgeDialogId.open()

                let resp = xhr.responseText.toString()
                callback(resp)
            }
            else{
                massgeDialogId.title = "Error"
                if(xhr.status){
                    massgeDialogId.text = "Error status: "+xhr.status
                }else{
                    massgeDialogId.text = "This card Id has already been used."
                }
                massgeDialogId.open()

                callback(null)
            }
        }

    }
    xhr.open(verb,baseURL+schema)
    var data = obj?JSON.stringify(obj):''
    xhr.setRequestHeader("content-type","application/json")
    console.log("send data : "+data)
    xhr.send(data)
}
