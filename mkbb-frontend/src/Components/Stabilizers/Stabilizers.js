import "./styles.css";
import NavbarComp from "../NavbarComponent";
import StabilizersRow from "./StabilizersRow";

function Stabilizers() {
    return(
        <div>
            <NavbarComp></NavbarComp>
            <h1>Stabilizers</h1>
            <table border="1">
                <thead>
                    <tr>
                        <td>PartID</td>
                        <td>Name</td>
                        <td>Brand</td>
                        <td>Price</td>
                        <td>Url</td>
                        <td>StabType</td>
                        <td>Info</td>
                        <td>Username</td>
                    </tr>
                </thead>
                <tbody>
                    <StabilizersRow />
                    <StabilizersRow />
                    <StabilizersRow />
                </tbody>
            </table>
        </div>
    )
}
export default Stabilizers;