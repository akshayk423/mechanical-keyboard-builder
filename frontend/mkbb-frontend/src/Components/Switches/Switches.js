import "./styles.css";

function Switches() {
    return(
        <div>
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
                <tr>
                    <td>00001</td>
                    <td>Cherry MX Red</td>
                    <td>Linear</td>
                    <td>Cherry</td>
                    <td>exampleSeller</td>
                    <td>$50.00</td>
                    <td><a href="www.google.com">Buy</a></td>
                </tr>
                <tr>
                    <td>00002</td>
                    <td>Cherry MX Red</td>
                    <td>Linear</td>
                    <td>Cherry</td>
                    <td>exampleSeller</td>
                    <td>$50.00</td>
                    <td><a href="www.google.com">Buy</a></td>
                </tr>
                <tr>
                    <td>00003</td>
                    <td>Cherry MX Blue</td>
                    <td>Tactile</td>
                    <td>Cherry</td>
                    <td>exampleSeller2</td>
                    <td>$45.00</td>
                    <td><a href="www.google.com">Buy</a></td>
                </tr>
            </table>
        </div>
    )
}
export default Switches;