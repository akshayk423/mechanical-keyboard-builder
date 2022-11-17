import "./styles.css"
import NavbarComp from "../NavbarComponent";
import ReportedListingRow from "./ReportedListingRow";

export default function() {
    return(
        <div>
            <NavbarComp />
            <h1>Reported Listings</h1>
            <table border="1">
                <thead>
                    <tr>
                        <td>PartID</td>
                        <td>Name</td>
                        <td>URL</td>
                        <td>Username</td>
                        <td>Delete Listing</td>
                    </tr>
                </thead>
                <tbody>
                    <ReportedListingRow />
                    <ReportedListingRow />
                    <ReportedListingRow />
                </tbody>
            </table>
        </div>
    )
}