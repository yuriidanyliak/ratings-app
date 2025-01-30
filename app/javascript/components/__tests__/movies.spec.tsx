/**
 * @jest-environment jsdom
 */

import * as React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';

import { Movies } from '../movies';

jest.mock('../movie_table', () => ({
  __esModule: true,
  default: () => <div data-testid="mocked-movie-table">Mocked Movie Table</div>,
}));

it('renders Movies component', () => {
  render(<Movies />);

  expect(screen.getByText('Movies List')).toBeInTheDocument();
  expect(screen.getByTestId('mocked-movie-table')).toBeInTheDocument();
});
