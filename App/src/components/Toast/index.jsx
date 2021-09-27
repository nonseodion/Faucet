import React from 'react'

export default function Toast({message}) {
  return (
    <div 
      className="absolute transform -translate-x-2/4 
        left-1/2 top-20 border-2 rounded p-2 
        border-red-800 text-red-800
        transition duration-500 ease-in-out
        ">
      {message}
    </div>
  )
}