import React from 'react';
import useMint from '../../hooks/useMint';
import { parseUnits } from '@ethersproject/units'
import useToast from '../../hooks/useToast';

export default function Mint({ setToast }) {
  const amount = parseUnits("10000", 8);
  const { send, state } = useMint()
  const handleClick = () => {
    send(amount, amount);
    console.log(amount, amount.toString());
  }

  useToast(state, setToast);

  return (
    <button className="bg-yellow-400 p-2 rounded" onClick={handleClick}>
      Mint
    </button>
  )
}
