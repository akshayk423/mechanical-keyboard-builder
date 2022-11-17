export default function PartListRow() {
    return (
        <tr id="row1">
            <td>
                <p>List1</p>
            </td>
            <td>
                <a href="/prebuilt" className="button">
                    Choose Keyboard
                </a>
            </td>
            <td>
                <a href="/case" className="button">
                    Choose Case
                </a>
            </td>
            <td>
                <a href="/PCBList" className="button">
                    Choose PCB
                </a>
            </td>
            <td>
                <a href="/switches">
                    Cherry MX Red
                </a>
            </td>
            <td>
                <a href="keycaps" className="button">
                    Choose Keycaps
                </a>
            </td>
            <td>
                <a href="stabilizers" className="button">
                    Choose Stabilizers
                </a>
            </td>
            <td>
                <a className="button button-delete">
                    Delete
                </a>
            </td>
        </tr>
    )
}