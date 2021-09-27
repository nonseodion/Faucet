import React from 'react';
import ErrorIcon from "../../assets/icons/error.png";
import LoadingIcon from "../../assets/icons/loading.png";
import CheckIcon from "../../assets/icons/checkmark.png";

function Toast({message, classes, icon}) {

  return (
    <div 
      className={`absolute transform -translate-x-2/4 
        left-1/2 top-20 border-2 rounded p-2 
        ${classes}
        transition duration-500 ease-in-out flex items-center
        `}>
      {icon} &nbsp; {message}
    </div>
  )
}

export function ErrorToast({active, message}){
  return <Toast 
    message={message} 
    classes={"border-red-800 text-red-800"} 
    icon = {<img src={ErrorIcon} alt="error" />}  
  />
}

export function LoadingToast({active, message}){
  return <Toast 
    message={message}
    classes={"border-gray-500 text-gray-500"}
    icon = {<img src={LoadingIcon} className="animate-spin" alt="loading"></img>}
  />
}

export function SuccessToast({active, message}){
  return <Toast 
    message={message}
    classes={"border-green-500 text-green-500"}
    icon = {<img src={CheckIcon} className="w-6" alt="successfull"></img>}
  />
}
