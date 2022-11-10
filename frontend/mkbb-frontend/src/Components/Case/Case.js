import "./styles.css";
import NavbarComp from "../NavbarComponent";

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
                    </tr>
                </thead>
                <tr>
                    <td>00001</td>
                    <td>Brand keycaps</td>
                    <td>Keycap</td>
                    <td>$50.00</td>
                    <td><a href="www.google.com">Buy</a></td>
                    <td>Size</td>
                    <td>exampleSeller</td>
                </tr>
                <tr>
                    <td>00002</td>
                    <td>Brand keycaps</td>
                    <td>Keycap</td>
                    <td>$50.00</td>
                    <td><a href="www.google.com">Buy</a></td>
                    <td>Size</td>
                    <td>exampleSeller</td>
                </tr>
                <tr>
                    <td>00003</td>
                    <td>Brand keycaps</td>
                    <td>Keycap</td>
                    <td>$50.00</td>
                    <td><a href="www.google.com">Buy</a></td>
                    <td>Size</td>
                    <td>exampleSeller</td>
                </tr>
            </table>
        </div>
    )
}
export default Case;