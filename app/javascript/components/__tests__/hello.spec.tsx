/**
 * @jest-environment jsdom
 */

import * as React from 'react';
import { render } from '@testing-library/react';

import { Hello } from '../hello';

it('Hello test with prop', () => {
  const { container } = render(<Hello name="Jest" />);
  expect(container).toHaveTextContent('Hello Jest!');
});

it('Hello test without prop', () => {
  const { container } = render(<Hello />);
  expect(container).toHaveTextContent('Hello !');
});
