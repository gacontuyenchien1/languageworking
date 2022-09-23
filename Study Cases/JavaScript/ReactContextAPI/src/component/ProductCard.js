import { useContext } from "react";
import { ThemeContext } from "./ThemeProvider";

function ProductCard(){
    const themesObj = useContext(ThemeContext);
    return <>
        <div style={themesObj.themes}>
            Non reprehenderit eiusmod aute elit id ex aute amet magna quis ut ut anim. Consequat nulla commodo incididunt do excepteur est irure. Reprehenderit aliqua aliquip consequat veniam mollit magna. Adipisicing consectetur consectetur anim nisi reprehenderit consectetur occaecat esse nisi commodo. Ex ullamco amet cillum aliquip veniam enim non anim reprehenderit enim do veniam labore in. Non qui commodo enim cupidatat labore cupidatat nulla cupidatat non dolor excepteur.
        </div>
    </>
}

export default ProductCard;