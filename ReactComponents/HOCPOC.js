import React, {Component} from 'react'

const HOC = InnerComponent => class extends Component {

  state = {
      count: 0
  }

  update = () => this.setState({count: this.state.count + 1})

  render = () => {
    return <InnerComponent
      {...this.props}
      {...this.state}
      update={this.update}
    />
  }
}

const Button = ({children, update, count}) => {
    return <button
      onDoubleClick={update}
      >{children} - {count}</button>
}

const Label = ({update, count}) => {
  return <span onMouseMove={update}>Hollyyyyy {count}</span>
}

const HocButton = HOC(Button)
const HocLabel = HOC(Label)

export default () => (
  <div>
    <HocButton pute="agag">Coucou</HocButton>
    <br/>
    <HocLabel />
  </div>
)
