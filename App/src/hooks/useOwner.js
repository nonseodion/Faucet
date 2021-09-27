import { useContractCall } from '@usedapp/core';
import useConstants from './useConstants';
import { utils } from 'ethers';

export default function useOwner() {
  const {FaucetABI, Faucet} = useConstants()
  const [owner] = useContractCall(
    { abi: new utils.Interface(FaucetABI), address: Faucet, method: "owner", args: [] }
  ) ?? [];

  return owner;
}
