import "./styles.css";
import NavbarComp from "../NavbarComponent";
import PrebuiltRow from "./PrebuiltRow";

function Prebuilt() {
    return(
        <div>
            <NavbarComp></NavbarComp>
            <h1>Prebuilt Keyboards</h1>
            <table border="1">
                <thead>
                    <tr>
                        <td>PartID</td>
                        <td>Name</td>
                        <td>Brand</td>
                        <td>Price</td>
                        <td>Url</td>
                        <td>Switch Name</td>
                        <td>Hotswappable</td>
                        <td>Username</td>
                        <td>Report Listing</td>
                    </tr>
                </thead>
                <tbody>
                    <PrebuiltRow />
                    <PrebuiltRow />
                    <PrebuiltRow />
                </tbody>
            </table>
        </div>
    )
}
export default Prebuilt;