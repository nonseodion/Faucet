import React, { useEffect } from 'react';
import { ErrorToast, LoadingToast, SuccessToast } from "../components/Toast";

export default function useToast(state, setToast) {
  const {status, errorMessage} = state;

  useEffect(() => {
    switch (status){
      case("Success"):
        setToast(<SuccessToast message="Transaction Successfull" />);
        break;
      case("Fail"):
      case("Exception"):
        setToast(<ErrorToast message={errorMessage} />);
        break;
      case("Mining"):
        setToast(<LoadingToast message={"Transaction Pending"} />);
        break;
      default:
        setToast(<></>);
    }  
  }, [status, errorMessage, setToast])

  useEffect(() => {
    if(status === "Success" ||
      status === "Fail"||
      status === "Exception"){
        setTimeout(() => setToast(<></>), 5000);
      }
  },[status, setToast])
}
