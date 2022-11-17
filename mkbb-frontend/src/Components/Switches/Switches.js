import "./styles.css";
import NavbarComp from "../NavbarComponent";
import SwitchesRow from "./SwitchesRow";

function Switches() {
    return(
        <div>
            <NavbarComp></NavbarComp>
            <h1>Switch Parts</h1>
            <table border="1">
                <thead>
                    <tr>
                        <td>PartID</td>
                        <td>Name</td>
                        <td>Brand</td>
                        <td>Price</td>
                        <td>Url</td>
                        <td>SwitchType</td>
                        <td>Username</td>
                    </tr>
                </thead>
                <SwitchesRow />
                <SwitchesRow />
                <SwitchesRow />
            </table>
        </div>
    )
}
export default Switches;