import React from 'react'
import { formatUnits } from '@ethersproject/units'
import { useEthers, useTokenBalance } from '@usedapp/core'
import useConstants from '../../hooks/useConstants';

export default function Balance() {

  const { account } = useEthers();
  const { HTML, SFUN } = useConstants();
  const HTMLBalance = useTokenBalance(HTML, account);
  const SFUNBalance = useTokenBalance(SFUN, account);

  return (
    <div>
      <h2 className="font-bold">Balances</h2>
      <p>HTML: {HTMLBalance && formatUnits(HTMLBalance, 8)} &nbsp; SFUN: {SFUNBalance && formatUnits(SFUNBalance, 8)}</p>
    </div>
  )
}
