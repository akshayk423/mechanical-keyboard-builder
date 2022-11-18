import PartListRow from "./PartListRow";
import "./styles.css";

function Lists() {
	return(
		<div>
			<table>
				<thead>
					<tr>
						<th>List</th>
						<th>Keyboard</th>
						<th>Case</th>
						<th>PCB</th>
						<th>Switches</th>
						<th>Keycaps</th>
						<th>Stabilizers</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<PartListRow />
					<PartListRow />
					<PartListRow />
				</tbody>
			</table>
		</div>
	)
}

export default Lists
