import Balance from "../Balances";
import Mint from "../Mint";
import Drip from "../Drip";
import ConnectWallet from "../Mint/ ConnectWallet";
import { useEthers } from "@usedapp/core";
import useOwner from "../../hooks/useOwner";

const Body = () => {
  const {account} = useEthers();
  const owner = useOwner();
  
  return (
    <section className="text-center mt-32">
      <h1 className="text-center text-6xl font-bold">HtmlCoin and Superfun Faucet</h1>
      <br/>
      <p>You can collect 3 drips a day from the Faucet and the faucet has a cool down period of 10s.</p>
      <p>Each drip gives you 3 HtmlCoins and 1 Superfun tokens</p>
      {account && <Balance />}
      <br />
      {!account ? 
        <ConnectWallet/> :
        <>
          <Drip /> 
          {owner === account && <Mint />}
        </>
      }

    </section>
  )
}
export default Body;