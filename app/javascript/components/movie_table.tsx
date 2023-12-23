// components/movie_table.tsx
import React, { useEffect, useState } from 'react';
import { Table } from 'antd';
import { ColumnsType } from 'antd/es/table';

interface Movie {
  title: string;
  year: number;
  genre: string;
}

const MovieTable: React.FC = () => {
  const [movies, setMovies] = useState<Movie[]>([]);

  useEffect(() => {
    // Fetch movies from your API endpoint
    fetch('/api/v1/movies')
      .then(response => response.json())
      .then(data => setMovies(data))
      .catch(error => console.error('Error fetching movies:', error));
  }, []);

  const columns: ColumnsType<Movie> = [
    { title: 'Title', dataIndex: 'title', key: 'title' },
    { title: 'Year', dataIndex: 'year', key: 'year' },
    { title: 'Genre', dataIndex: 'genre', key: 'genre' },
  ];

  return <Table dataSource={movies} columns={columns} />;
};

export default MovieTable;
