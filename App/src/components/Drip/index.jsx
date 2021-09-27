import React from 'react';
import useDrip from '../../hooks/useDrip';
import useToast from '../../hooks/useToast';

export default function Drip( {setToast}) {
  const {state, send} = useDrip();

  const handleClick = () => {
    send();
  }
  useToast(state, setToast);

  return (
    <button className="bg-green-400 p-2 rounded mr-4" onClick={handleClick}>
      Collect Drip
    </button>
  )
}
