import { ThemeContext, THEMES } from "./ThemeProvider";
import { Button } from 'react-bootstrap';
import { useContext, useState } from "react";

function ThemeButton(){
    const [light, setLight] = useState(true);
    const themes = useContext(ThemeContext);
    const handleChangeTheme = () => {
        if (light) themes.setThemes(THEMES.dark);
        else themes.setThemes(THEMES.light);
        setLight(!light);
    }

    return <>
        <Button onClick={handleChangeTheme} variant="primary">{light? 'Light' : 'Dark'}</Button>
        <Button as="a" variant="success">
            Button as link
        </Button>
    </>
}

export default ThemeButton;