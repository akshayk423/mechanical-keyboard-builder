import "./styles.css";
import NavbarComp from "../NavbarComponent";
import CasePartRow from "./CasePartRow";

function Case() {
    return(
        <div>
            <NavbarComp></NavbarComp>
            <h1>Cases</h1>
            <table border="1">
                <thead>
                    <tr>
                        <td>PartID</td>
                        <td>Name</td>
                        <td>Brand</td>
                        <td>Price</td>
                        <td>Url</td>
                        <td>Size</td>
                        <td>Username</td>
                        <td>Report Listing</td>
                    </tr>
                </thead>
                <tbody>
                    <CasePartRow />
                    <CasePartRow />
                    <CasePartRow />
                </tbody>
            </table>
        </div>
    )
}
export default Case;