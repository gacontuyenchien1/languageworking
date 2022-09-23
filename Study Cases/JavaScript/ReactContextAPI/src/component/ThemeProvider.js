import React, { useState } from "react";

export const THEMES = {
    light: {
        theme: 'light',
        foreground: '#000000',
        background: '#eeeeee',
    },
    dark: {
        theme: 'dark',
        foreground: '#ffffff',
        background: '#222222',
        color: '#efefef',
    },
  };
  
export const ThemeContext = React.createContext({});

function ThemeProvider( {children} ){
    const [themes, setThemes] = useState( THEMES.light );
    return <ThemeContext.Provider value={{themes, setThemes}}>
        {children}
    </ThemeContext.Provider>
}

export default ThemeProvider;