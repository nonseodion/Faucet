import React from 'react';
import { useEthers } from '@usedapp/core';

export default function Mint() {
  const { activateBrowserWallet } = useEthers()
  const handleClick = () => {
    activateBrowserWallet();
  }

  return (
    <button className="bg-yellow-400 p-2 rounded" onClick={handleClick}>
      Connect Wallet
    </button>
  )
}
