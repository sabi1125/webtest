<script lang="ts">
import Counter from './components/Counter.svelte'
let totalNumber:number = 0;
let id:number= 1;
let counters=[{
	id:0,
	num:0,
	text:"new"
}]

</script>

<header>
	<h1>Multiple Counters</h1>
</header>






<main>
	{#each counters as counter}
	<div class="counter">
		<h1>{counter.id}</h1>
	<input type="text"
	class="text"
	bind:value={counter.text}
	>
	<Counter 
	{counter}
	 
	on:add={()=>{
		totalNumber++
	}} 
	on:subs={()=>{
		if(totalNumber>0){
			totalNumber--
		}
		
	}}
	on:zero={(e)=>{
		totalNumber -= e.detail
	}}
	on:remove={(e)=>{
		counters = counters.filter(counter=>counter.id !== e.detail.id )
		totalNumber -= e.detail.num
	}}
	on:text={(e)=>{
		console.log(e.detail)
	}}
	/>
	</div>
	{/each}
</main>
<article>
	<input type="button" value="Add Button" class="add-counter"
	on:click={
		()=>{
			let newCounter = {
				id:id,
				num:0,
				text:"new"
			}
			console.log(counters.length)
			id +=1;
			counters = [...counters,newCounter]
		}
	}
	>
	<strong>sum of count: {totalNumber}</strong>
	<strong>Titles: {#each counters as counter}
		{#if counters.length <= 1 || counters.length == counters.length - 1  }
		{counter.text}
		{:else}
		{counter.text}, 
		{/if}
		{/each}</strong>
</article>











<style>
	main {
		text-align: center;
		width: 500px;
		display: flex;
		flex-direction: column;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}
	.counter{
		padding: 40px;
		margin: 8px;
		background: #3d405b;
		border-radius: 5px;
		box-shadow: 10px 10px 20px rgba(0,0,0,0.5);
	}
	header{
		text-align: center;
	}
	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 3em;
		font-weight: 100;
	}
	article{
		display: flex;
		flex-direction: column;
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
		
	}
	.add-counter{
		padding: 12px;
		border: 1px black solid;
		background:none;
		border-radius: 5px;
		cursor: pointer;
		transition: 0.2s ease-in-out;
	}
	.add-counter:hover{
		background-color:rgba(0,0,0,0.8);
		color: white;
		box-shadow: 5px 5px 5px rgba(0,0,0,0.5);
		border: 1px solid rgba(0,0,0,0.5);
	}

	.text{
		outline: none;
		text-align: center;
		border-radius:4px;
		color: grey;
	}



	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>