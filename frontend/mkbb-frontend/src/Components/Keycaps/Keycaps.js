import "./styles.css";
import NavbarComp from "../NavbarComponent";
import KeycapsRow from "./KeycapsRow";

function Keycaps() {
    return(
        <div>
            <NavbarComp></NavbarComp>
            <h1>Keycaps</h1>
            <table border="1">
                <thead>
                    <tr>
                        <td>PartID</td>
                        <td>Name</td>
                        <td>Brand</td>
                        <td>Price</td>
                        <td>Url</td>
                        <td>Profile</td>
                        <td>Material</td>
                        <td>Username</td>
                    </tr>
                </thead>
                <KeycapsRow />
                <KeycapsRow />
                <KeycapsRow />
            </table>
        </div>
    )
}
export default Keycaps;