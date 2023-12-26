import { Layout } from 'antd';
import * as React from 'react';
import { Movies } from '../components/movies';

import './main.css';

export const Main: React.FC = () => {
  return (
    <Layout style={{ height: '100vh', justifyContent: 'center' }}>
      <Movies />
    </Layout>
  );
};
