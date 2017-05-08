import React from 'react'
import { render } from 'react-dom'
import HOCPOC from './ReactComponents/HOCPOC'
import MyField from './ReactComponents/MyField'

render(
  <div>
    <HOCPOC />
    <MyField />
  </div>,
  document.getElementById('root'),
)
