import React from 'react';
import useMint from '../../hooks/useMint';
import { parseUnits } from '@ethersproject/units'

export default function Mint() {
  const amount = parseUnits("10000", 8);
  const { send, state } = useMint()
  const handleClick = () => {
    send(amount, amount);
    console.log(amount, amount.toString());
  }

  return (
    <button className="bg-yellow-400 p-2 rounded" onClick={handleClick}>
      Mint
    </button>
  )
}
