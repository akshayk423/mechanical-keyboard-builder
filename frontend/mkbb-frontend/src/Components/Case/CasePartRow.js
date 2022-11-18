export default function CasePartRow() {
    const onSubmit = () => {
        console.log("Listing reported.")
        return;
    }

    return(
        <tr>
            <td><a>00001</a></td>
            <td>Brand keycaps</td>
            <td>Keycap</td>
            <td>$50.00</td>
            <td><a href="www.google.com">Buy</a></td>
            <td>Size</td>
            <td>exampleSeller</td>
            <td><button onClick={onSubmit}>Report</button></td>
        </tr>
    )
}