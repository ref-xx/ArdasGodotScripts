# Automatic Collision Mask Assigner Import Script for Godot (tested on 4.2) by Arda Erdikmen
# 1.export all your meshes in one, single gltf/glb file
# 2.add this importer script and your glb package to your game folder
# 3.double click it so it shows the gtlf and all your meshes and materials
# 4.in import script property, select this mesh import script.
# 5.click ReImport button and close the importer window.
# 6.right click your meshes and select "new inherited scene"
# 7.you will see all your meshes has a convex collision masks.
# 8.select Scene>export as>meshlibrary and finalize your conversion.


@tool # Needed so it runs in editor.
extends EditorScenePostImport

func _post_import(scene):
	iterate(scene)
	return scene # Remember to return the imported scene

# Recursive function that is called on every node
func iterate(node):
	if node != null:
		if node is MeshInstance3D:	
			node.set_physics_process(true);
			node.create_convex_collision(true,true);
			#change above line if you want a different kind of collision mask
		
		for child in node.get_children():
			iterate(child)
		
		
