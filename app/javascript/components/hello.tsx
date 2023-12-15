import * as React from 'react';

type Props = {
  name?: string;
};

export const Hello: React.FC<Props> = ({ name }) => {
  return <h1 style={{ textAlign: 'center' }}>Hello {name}!</h1>;
};
