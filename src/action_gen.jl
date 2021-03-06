"""
Generate a new action when the set of actions is widened.
"""
function next_action{S,A}(gen::RandomActionGenerator, mdp::Union{POMDP,MDP}, s, snode::DPWStateNode{S,A})
    if isnull(gen.action_space) 
        gen.action_space = Nullable{AbstractSpace}(actions(mdp))
    end
    rand(gen.rng, actions(mdp, s, get(gen.action_space)))
end
