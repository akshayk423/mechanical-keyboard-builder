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
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<a href="/products/cpu/">List1</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose PCB
							</a>
						</td>
						<td>
							<a href="/products/cpu/">
								Cherry MX Red
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button button-delete">
								Delete
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="/products/cpu/">List2</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/products/cpu/">
								Example PCB
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Switch
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button button-delete">
								Delete
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="/products/cpu/">List3</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keyboard
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Case
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose PCB
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Switch
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button">
								Choose Keycaps
							</a>
						</td>
						<td>
							<a href="/products/cpu/" class="button button-delete">
								Delete
							</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	)
}

export default Lists
