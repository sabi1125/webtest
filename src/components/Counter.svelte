<script lang="ts">
    //imports
    import { createEventDispatcher } from 'svelte';
    const dispatch = createEventDispatcher();

    //exports
    export let counter;
    
</script>

<main>

    <h1>{counter.num}</h1>
   
    <input type="button" value="+" 
    on:click={
    
    ()=>{
        counter.num++
        dispatch("add")
    }
    }>
    <input type="button" value="-" 
    on:click={

        ()=>{
            if(counter.num>0){
            counter.num--
            dispatch("subs")
        }
        }
        }
    >
    <input type="button" value="0" 
    on:click={
        ()=>{
            dispatch("zero",counter.num)
            counter.num = 0
        }
    }
    >
    <input type="button" value="x"
    on:click={
        ()=>{
            dispatch("remove",counter)
        }
    }
    >
</main>


<style>
    h1{
        color: white;
    }

	input{
		cursor: pointer;
        padding: 10px;
        background-color: #3d405b;
        border: none;
        color: white;
        transition: 0.2s ease-in-out;
	}
    input:hover{
        transform: scale(1.3);
    }
</style>