import React, { PropTypes } from 'react';

export default class Comment extends React.Component {
  static propTypes = {
    data: PropTypes.object,
    index: PropTypes.number,
  };

  constructor(props) {
    super(props);
    this.state = {
      author: '', 
      text: ''
    };
  }

  // Pulls down the comment's user's username by making ajax call to api. Sets state for this
  componentDidMount() {
    this.serverRequest = $.get("/user/" + this.props.data.user_id + ".json", function (result) {
      var lastGist = result;
      console.log(lastGist);
      this.setState({
        author: lastGist.username,
        text: this.props.data.body
      });
    }.bind(this));
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }


  render() {
    const { index, data } = this.props;
    return (
      <div className="row">
        <strong>{this.state.author}: </strong>{this.state.text}
      </div>
    );
  }
}
