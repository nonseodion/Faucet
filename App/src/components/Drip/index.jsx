import React from 'react';
import useDrip from '../../hooks/useDrip';

export default function Drip() {
  const {state, send} = useDrip();
  const handleClick = () => {
    send();
  }
  return (
    <button className="bg-green-400 p-2 rounded mr-4" onClick={handleClick}>
      Collect Drip
    </button>
  )
}
