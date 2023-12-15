import { Layout, Empty } from 'antd';
import * as React from 'react';

import './main.css';

export const Main: React.FC = () => {
  return (
    <Layout style={{ height: '100vh', justifyContent: 'center' }}>
      <Empty description="Hello React Typescript. Yay!" />
    </Layout>
  );
};
