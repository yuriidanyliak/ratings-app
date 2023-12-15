import * as React from 'react';
import * as ReactDOM from 'react-dom';

import { Main } from '../layouts/main';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Main />, document.body.appendChild(document.createElement('div')));
});
