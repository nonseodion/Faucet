import { useEthers } from '@usedapp/core'

const Header = () => {
  
  const { account } = useEthers()

  return(
    <section className="justify-between flex content-center">
    <h1 className="font-bold text-2xl">Faucet</h1>
    {account && <p>Address: {`${account.substring(0,4)}...${account.substring(39)}`}</p>}
  </section>
  )
}

export default Header;