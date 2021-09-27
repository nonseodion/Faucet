import { useContractFunction } from "@usedapp/core";
import useContracts from "./useContracts";

const useMint = () => {
  
  const {faucet} = useContracts();
  const {state, send} = useContractFunction(faucet, "mint");
  return {state, send};
}

export default useMint;