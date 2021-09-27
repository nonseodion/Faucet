import { useContractFunction } from "@usedapp/core";
import useContracts from "./useContracts"


const useDrip = () => {
  const {faucet} = useContracts();
  const {state, send} = useContractFunction(faucet, "drip");
  return {state, send};
}

export default useDrip;