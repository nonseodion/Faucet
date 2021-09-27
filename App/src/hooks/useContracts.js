import { utils } from 'ethers';
import { Contract } from '@ethersproject/contracts';
import useConstants from './useConstants';

export default function useContracts() {
  const {Faucet, SFUN, HTML, HRC20ABI, FaucetABI} = useConstants()
  return {
    faucet: new Contract(Faucet, new utils.Interface(FaucetABI)),
    sfun: new Contract(SFUN, new utils.Interface(HRC20ABI)),
    html: new Contract(HTML, new utils.Interface(HRC20ABI))
  }
}
