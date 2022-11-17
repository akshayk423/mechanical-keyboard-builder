import "./styles.css";
import NavbarComp from "../NavbarComponent";
import PCBRow from "./PCBRow";

function PCBList() {
    return(
        <div>
            <NavbarComp></NavbarComp>
            <h1>PCB</h1>
            <table border="1">
                <thead>
                    <tr>
                        <td>PartID</td>
                        <td>Name</td>
                        <td>Brand</td>
                        <td>Price</td>
                        <td>Url</td>
                        <td>Contains RGB</td>
                        <td>HotSwappable</td>
                        <td>Connection Type</td>
                        <td>Size</td>
                        <td>Username</td>
                    </tr>
                </thead>
                <PCBRow />
                <PCBRow />
                <PCBRow />
            </table>
        </div>
    )
}
export default PCBList;