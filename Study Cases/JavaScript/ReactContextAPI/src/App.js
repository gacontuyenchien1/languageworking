import React from 'react';

import './App.css';
import ProductCard from './component/ProductCard';
import ThemeButton from './component/ThemeButton';
import ThemeProvider from './component/ThemeProvider';

function App() {
  return (
      <ThemeProvider>
        <div className="App">
          <ThemeButton/>
          <ProductCard/>
        </div>
      </ThemeProvider>
  );
}

export default App;
